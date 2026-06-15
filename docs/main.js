/* main.js — renders the site from data.js and wires up interaction.
   No framework, no build step. */
(function () {
  "use strict";

  const $  = (s, r = document) => r.querySelector(s);
  const $$ = (s, r = document) => Array.from(r.querySelectorAll(s));

  /* ---------- tiny DOM helper ---------- */
  function el(tag, attrs = {}, ...kids) {
    const node = document.createElement(tag);
    for (const [k, v] of Object.entries(attrs)) {
      if (v == null || v === false) continue;
      if (k === "class") node.className = v;
      else if (k === "text") node.textContent = v;
      else if (k === "html") node.innerHTML = v;
      else if (k.startsWith("on") && typeof v === "function") node.addEventListener(k.slice(2), v);
      else node.setAttribute(k, v);
    }
    for (const kid of kids.flat()) {
      if (kid == null) continue;
      node.append(kid.nodeType ? kid : document.createTextNode(kid));
    }
    return node;
  }

  const PH_GLYPH = {
    image: "M3 5h18v14H3z M3 16l5-5 4 4 3-3 6 6 M8.5 9.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0",
    video: "M4 5h16v14H4z M10 9l5 3-5 3z",
  };

  /* ---------- media (with graceful placeholder) ---------- */
  function placeholder(caption, type) {
    return el("figure", { class: "media media--ph" },
      el("svg", { class: "ph-glyph", viewBox: "0 0 24 24", "aria-hidden": "true",
        html: `<path d="${PH_GLYPH[type] || PH_GLYPH.image}" stroke-linejoin="round" stroke-linecap="round"/>` }),
      el("span", { class: "ph-label", text: caption || "media coming soon" }),
    );
  }

  function media(item) {
    if (!item || !item.src) return placeholder(item && item.caption, item && item.type);
    const fig = el("figure", { class: item.fit === "contain" ? "media media--fig" : "media" });
    let node;
    if (item.type === "video") {
      node = el("video", { src: item.src, poster: item.poster || null, controls: "",
        preload: "metadata", playsinline: "" });
    } else {
      node = el("img", { src: item.src, alt: item.alt || item.caption || "",
        loading: "lazy", decoding: "async" });
    }
    // swap to placeholder if the file isn't there yet
    node.addEventListener("error", () => fig.replaceWith(placeholder(item.caption, item.type)), { once: true });
    fig.append(node);
    if (item.caption) fig.append(el("figcaption", { text: item.caption }));
    return fig;
  }

  /* ---------- small shared pieces ---------- */
  const tagList = (tags) => tags && tags.length
    ? el("ul", { class: "tags" }, tags.map((t) => el("li", { text: t }))) : null;

  const statList = (hi) => hi && hi.length
    ? el("ul", { class: "stats" }, hi.map((h) => el("li", { text: h }))) : null;

  const linkList = (links, cls) => {
    const live = (links || []).filter((l) => l.href);
    return live.length ? el("div", { class: cls },
      live.map((l) => el("a", { href: l.href, target: "_blank", rel: "noopener", text: l.label }))) : null;
  };

  /* ---------- featured block ---------- */
  function featured(p) {
    const [cover, ...rest] = p.media && p.media.length ? p.media : [null];
    const gallery = el("div", { class: "feat__gallery" }, media(cover));
    if (rest.length) gallery.append(el("div", { class: "feat__thumbs" }, rest.slice(0, 2).map(media)));

    return el("article", { class: "feat reveal" },
      el("div", { class: "feat__media" }, gallery),
      el("div", { class: "feat__info" },
        el("p", { class: "feat__role", text: p.role }),
        el("h3", { class: "feat__title", text: p.title }),
        el("p", { class: "feat__tagline", text: p.tagline }),
        el("p", { class: "feat__summary", text: p.summary }),
        el("div", { class: "feat__body" }, (p.body || []).map((t) => el("p", { text: t }))),
        statList(p.highlights),
        tagList(p.tags),
        linkList(p.links, "proj-links"),
      ),
    );
  }

  /* ---------- grid card ---------- */
  function card(p) {
    const cover = p.media && p.media.length ? p.media[0] : null;
    return el("article", { class: "card reveal" },
      media(cover),
      el("div", { class: "card__body" },
        el("h3", { class: "card__title", text: p.title }),
        el("p", { class: "card__tagline", text: p.tagline }),
        el("div", { class: "card__tags" }, tagList(p.tags)),
      ),
      el("button", { class: "card__hit", type: "button",
        "aria-label": "View " + p.title, onclick: () => openDialog(p) }),
    );
  }

  /* ---------- detail dialog ---------- */
  const dialog = $("#project-dialog");
  const dialogBody = $("#dialog-body");
  let lastFocused = null;

  function openDialog(p) {
    lastFocused = document.activeElement;
    dialogBody.replaceChildren(
      el("p", { class: "dlg-role", text: p.role }),
      el("h2", { class: "dlg-title", id: "dialog-title", text: p.title }),
      el("p", { class: "dlg-tagline", text: p.tagline }),
      el("div", { class: "dlg-gallery" }, (p.media && p.media.length ? p.media : [null]).map(media)),
      el("div", { class: "dlg-body" },
        el("p", { html: "<strong>" + escapeHTML(p.summary) + "</strong>" }),
        (p.body || []).map((t) => el("p", { text: t })),
      ),
      statList(p.highlights),
      tagList(p.tags),
      linkList(p.links, "proj-links"),
    );
    if (typeof dialog.showModal === "function") dialog.showModal();
    else dialog.setAttribute("open", "");
    dialogBody.scrollTop = 0;
  }

  function escapeHTML(s) {
    return String(s).replace(/[&<>"]/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c]));
  }

  function closeDialog() { dialog.close ? dialog.close() : dialog.removeAttribute("open"); }
  $("[data-close]", dialog).addEventListener("click", closeDialog);
  dialog.addEventListener("click", (e) => { if (e.target === dialog) closeDialog(); }); // backdrop
  dialog.addEventListener("close", () => { if (lastFocused) lastFocused.focus(); });

  /* ---------- profile bits ---------- */
  function renderSocial() {
    $$("[data-social]").forEach((ul) => {
      ul.replaceChildren(...(PROFILE.links || []).map((l) =>
        el("li", {}, el("a", { href: l.href,
          target: l.href.startsWith("mailto:") ? null : "_blank",
          rel: "noopener", text: l.label }))));
    });
  }

  function renderPublications() {
    const ul = $("[data-publications]");
    if (!ul) return;
    ul.replaceChildren(...(PUBLICATIONS || []).map((pub) =>
      el("li", {},
        el("p", { class: "pub-title" }, pub.href
          ? el("a", { href: pub.href, target: "_blank", rel: "noopener", text: pub.title })
          : pub.title),
        el("p", { class: "pub-meta", text: pub.authors }),
        el("p", { class: "pub-meta", text: pub.venue }),
        pub.note ? el("p", { class: "pub-note", text: pub.note }) : null,
      )));
  }

  /* ---------- theme ---------- */
  const root = document.documentElement;
  const themeColors = { light: "#f5f1ea", dark: "#15120e" };
  function applyTheme(t) {
    if (t) root.setAttribute("data-theme", t); else root.removeAttribute("data-theme");
    const effective = t || (matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light");
    $$('meta[name="theme-color"]').forEach((m) => m.setAttribute("content", themeColors[effective]));
  }
  applyTheme(localStorage.getItem("theme"));
  $(".theme-toggle").addEventListener("click", () => {
    const cur = root.getAttribute("data-theme")
      || (matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light");
    const next = cur === "dark" ? "light" : "dark";
    localStorage.setItem("theme", next);
    applyTheme(next);
  });

  /* ---------- scroll reveal + stagger ---------- */
  const reduce = matchMedia("(prefers-reduced-motion: reduce)").matches;
  function setupReveal() {
    const items = $$(".reveal");
    if (reduce || !("IntersectionObserver" in window)) { items.forEach((n) => n.classList.add("in")); return; }
    // stagger hero items
    $$(".hero .reveal").forEach((n, i) => n.style.setProperty("--i", i));
    const io = new IntersectionObserver((entries) => {
      entries.forEach((e) => { if (e.isIntersecting) { e.target.classList.add("in"); io.unobserve(e.target); } });
    }, { rootMargin: "0px 0px -8% 0px", threshold: 0.08 });
    items.forEach((n) => io.observe(n));
  }

  /* ---------- header + nav state ---------- */
  function setupChrome() {
    const header = $(".site-header");
    const onScroll = () => header.classList.toggle("is-stuck", window.scrollY > 8);
    onScroll();
    addEventListener("scroll", onScroll, { passive: true });

    const links = new Map($$(".site-nav a[href^='#']").map((a) => [a.getAttribute("href").slice(1), a]));
    const secs = $$("section[id]").filter((s) => links.has(s.id));
    if ("IntersectionObserver" in window && secs.length) {
      const io = new IntersectionObserver((entries) => {
        entries.forEach((e) => {
          if (e.isIntersecting) {
            links.forEach((a) => a.classList.remove("is-active"));
            links.get(e.target.id)?.classList.add("is-active");
          }
        });
      }, { rootMargin: "-45% 0px -50% 0px" });
      secs.forEach((s) => io.observe(s));
    }
  }

  /* ---------- CV link: hide if the PDF isn't present ---------- */
  function checkCV() {
    const links = $$("a[data-cv]");
    if (!links.length) return;
    fetch(links[0].getAttribute("href"), { method: "HEAD" })
      .then((r) => { if (!r.ok) links.forEach((a) => a.remove()); })
      .catch(() => {});
  }

  /* ---------- portrait fallback (monogram if no photo) ---------- */
  function checkPortrait() {
    const fig = $("[data-portrait]");
    if (!fig) return;
    const img = $("img", fig);
    if (!img) return;
    img.addEventListener("error", () => {
      fig.classList.add("hero__portrait--ph");
      fig.replaceChildren(el("span", { class: "monogram", text: "JC" }));
    }, { once: true });
  }

  /* ---------- boot ---------- */
  document.addEventListener("DOMContentLoaded", () => {
    const feat = PROJECTS.filter((p) => p.featured);
    const rest = PROJECTS.filter((p) => !p.featured);
    $("#featured").replaceChildren(...feat.map(featured));
    $("#grid").replaceChildren(...rest.map(card));
    renderSocial();
    renderPublications();
    const yr = $(".site-footer__year");
    if (yr) yr.textContent = "© " + new Date().getFullYear();
    setupReveal();
    setupChrome();
    checkCV();
    checkPortrait();
  });
})();
