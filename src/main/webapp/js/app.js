// ==================================================
// KS Portfolio
// app.js
// ==================================================

"use strict";


// ==================================================
// SCROLL RESTORATION
// ==================================================

if ("scrollRestoration" in history) {
    history.scrollRestoration = "manual";
}


// ==================================================
// PAGE ELEMENTS
// ==================================================

const pages =
    document.querySelectorAll(".page");

const pageLinks =
    document.querySelectorAll("[data-page]");

const navLinks =
    document.querySelectorAll(".nav [data-page]");


// ==================================================
// PAGE TITLES
// ==================================================

const pageTitles = {

    home:
        "KS Portfolio",

    about:
        "About | KS Portfolio",

    skills:
        "Skills | KS Portfolio",

    works:
        "Works | KS Portfolio",

    detail:
        "Project Detail | KS Portfolio",

    learning:
        "Learning | KS Portfolio",

    system:
        "System | KS Portfolio",

    contact:
        "Contact | KS Portfolio"

};


// ==================================================
// SHOW PAGE
// ==================================================

function showPage(
    pageName,
    addHistory = true
) {

    let targetPage =
        document.getElementById(
            pageName
        );


    // --------------------------------------------------
    // 存在しないページはHOMEへ
    // --------------------------------------------------

    if (!targetPage) {

        pageName = "home";

        targetPage =
            document.getElementById(
                "home"
            );


        if (!targetPage) {
            return;
        }
    }


    // --------------------------------------------------
    // 全ページ非表示
    // --------------------------------------------------

    pages.forEach(page => {

        page.classList.remove(
            "active-page"
        );

    });


    // --------------------------------------------------
    // 対象ページ表示
    // --------------------------------------------------

    targetPage.classList.add(
        "active-page"
    );


    // --------------------------------------------------
    // NAV ACTIVE
    // --------------------------------------------------

    /*
     * detailはWORKSの配下なので
     * ナビゲーション上ではWORKSをactiveにする
     */

    const activeNavPage =
        pageName === "detail"
            ? "works"
            : pageName;


    navLinks.forEach(link => {

        link.classList.remove(
            "active"
        );


        if (
            link.dataset.page
            === activeNavPage
        ) {

            link.classList.add(
                "active"
            );

        }

    });


    // --------------------------------------------------
    // TITLE
    // --------------------------------------------------

    document.title =
        pageTitles[pageName]
        || "KS Portfolio";


    // --------------------------------------------------
    // URL
    // --------------------------------------------------

    if (addHistory) {

        const url =
            new URL(
                window.location.href
            );


        url.searchParams.set(
            "page",
            pageName
        );


        /*
         * 詳細ページ以外では
         * ?id=1 を削除
         */

        if (pageName !== "detail") {

            url.searchParams.delete(
                "id"
            );

        }


        history.pushState(

            {
                page: pageName
            },

            "",

            url

        );

    }


    // --------------------------------------------------
    // ページ先頭へ移動
    // --------------------------------------------------

    window.scrollTo(
        0,
        0
    );

}


// ==================================================
// PAGE LINK CLICK
// ==================================================

pageLinks.forEach(link => {

    link.addEventListener(
        "click",
        function(event) {

            const pageName =
                this.dataset.page;


            if (!pageName) {
                return;
            }


            event.preventDefault();


            showPage(
                pageName,
                true
            );

        }
    );

});


// ==================================================
// BROWSER BACK / FORWARD
// ==================================================

window.addEventListener(
    "popstate",
    function() {

        const params =
            new URLSearchParams(
                window.location.search
            );


        const pageName =
            params.get("page")
            || "home";


        showPage(
            pageName,
            false
        );

    }
);


// ==================================================
// INITIAL PAGE
// ==================================================

function initializePage() {

    const params =
        new URLSearchParams(
            window.location.search
        );


    const pageName =
        params.get("page")
        || "home";


    showPage(
        pageName,
        false
    );


    window.scrollTo(
        0,
        0
    );

}


// ==================================================
// PAGE INITIALIZE
// ==================================================

initializePage();


// ==================================================
// IMAGE LIGHTBOX
// ==================================================

const galleryButtons =
    Array.from(
        document.querySelectorAll(
            ".js-gallery-open"
        )
    );


const imageLightbox =
    document.getElementById(
        "imageLightbox"
    );


const lightboxImage =
    document.getElementById(
        "lightboxImage"
    );


const lightboxCaption =
    document.getElementById(
        "lightboxCaption"
    );


const lightboxClose =
    document.getElementById(
        "lightboxClose"
    );


const lightboxPrev =
    document.getElementById(
        "lightboxPrev"
    );


const lightboxNext =
    document.getElementById(
        "lightboxNext"
    );


let currentGalleryIndex = 0;

let lastFocusedElement = null;


// ==================================================
// SHOW GALLERY IMAGE
// ==================================================

function showGalleryImage(index) {

    if (
        galleryButtons.length === 0
        ||
        !lightboxImage
    ) {

        return;

    }


    // --------------------------------------------------
    // 最後の次 → 最初
    // --------------------------------------------------

    if (index >= galleryButtons.length) {

        index = 0;

    }


    // --------------------------------------------------
    // 最初の前 → 最後
    // --------------------------------------------------

    if (index < 0) {

        index =
            galleryButtons.length - 1;

    }


    currentGalleryIndex =
        index;


    const button =
        galleryButtons[
            currentGalleryIndex
        ];


    const image =
        button.querySelector(
            ".gallery-image"
        );


    const caption =
        button.querySelector(
            ".gallery-caption"
        );


    if (!image) {
        return;
    }


    // --------------------------------------------------
    // 画像変更
    // --------------------------------------------------

    lightboxImage.src =
        image.src;


    lightboxImage.alt =
        image.alt;


    // --------------------------------------------------
    // キャプション変更
    // --------------------------------------------------

    if (lightboxCaption) {

        lightboxCaption.textContent =
            caption
                ? caption.textContent.trim()
                : image.alt;

    }

}


// ==================================================
// OPEN LIGHTBOX
// ==================================================

function openLightbox(button) {

    if (
        !imageLightbox
        ||
        !lightboxImage
    ) {

        return;

    }


    const index =
        galleryButtons.indexOf(
            button
        );


    if (index < 0) {
        return;
    }


    lastFocusedElement =
        document.activeElement;


    showGalleryImage(
        index
    );


    imageLightbox.classList.add(
        "active"
    );


    imageLightbox.setAttribute(
        "aria-hidden",
        "false"
    );


    // 背景ページのスクロールを止める
    document.body.style.overflow =
        "hidden";


    // ×ボタンへフォーカス
    if (lightboxClose) {

        lightboxClose.focus();

    }

}


// ==================================================
// CLOSE LIGHTBOX
// ==================================================

function closeLightbox() {

    if (!imageLightbox) {
        return;
    }


    imageLightbox.classList.remove(
        "active"
    );


    imageLightbox.setAttribute(
        "aria-hidden",
        "true"
    );


    // --------------------------------------------------
    // 画像クリア
    // --------------------------------------------------

    if (lightboxImage) {

        lightboxImage.src = "";

        lightboxImage.alt = "";

    }


    // --------------------------------------------------
    // キャプションクリア
    // --------------------------------------------------

    if (lightboxCaption) {

        lightboxCaption.textContent =
            "";

    }


    // --------------------------------------------------
    // 背景スクロール復活
    // --------------------------------------------------

    document.body.style.overflow =
        "";


    // --------------------------------------------------
    // 元の画像へフォーカスを戻す
    // --------------------------------------------------

    if (
        lastFocusedElement
        &&
        typeof lastFocusedElement.focus
            === "function"
    ) {

        lastFocusedElement.focus();

    }

}


// ==================================================
// GALLERY CLICK
// ==================================================

galleryButtons.forEach(button => {

    button.addEventListener(
        "click",
        function() {

            openLightbox(
                this
            );

        }
    );

});


// ==================================================
// CLOSE BUTTON
// ==================================================

if (lightboxClose) {

    lightboxClose.addEventListener(
        "click",
        function(event) {

            event.stopPropagation();


            closeLightbox();

        }
    );

}


// ==================================================
// PREVIOUS IMAGE
// ==================================================

if (lightboxPrev) {

    lightboxPrev.addEventListener(
        "click",
        function(event) {

            event.stopPropagation();


            showGalleryImage(
                currentGalleryIndex - 1
            );

        }
    );

}


// ==================================================
// NEXT IMAGE
// ==================================================

if (lightboxNext) {

    lightboxNext.addEventListener(
        "click",
        function(event) {

            event.stopPropagation();


            showGalleryImage(
                currentGalleryIndex + 1
            );

        }
    );

}


// ==================================================
// BACKGROUND CLICK
// ==================================================

if (imageLightbox) {

    imageLightbox.addEventListener(
        "click",
        function(event) {

            /*
             * 黒い背景そのものを
             * クリックした時だけ閉じる
             */

            if (
                event.target
                === imageLightbox
            ) {

                closeLightbox();

            }

        }
    );

}


// ==================================================
// KEYBOARD CONTROL
// ==================================================

document.addEventListener(
    "keydown",
    function(event) {

        // ライトボックスが開いていなければ何もしない
        if (
            !imageLightbox
            ||
            !imageLightbox.classList.contains(
                "active"
            )
        ) {

            return;

        }


        // --------------------------------------------------
        // ESC
        // --------------------------------------------------

        if (event.key === "Escape") {

            closeLightbox();

            return;

        }


        // --------------------------------------------------
        // LEFT
        // --------------------------------------------------

        if (event.key === "ArrowLeft") {

            event.preventDefault();


            showGalleryImage(
                currentGalleryIndex - 1
            );


            return;

        }


        // --------------------------------------------------
        // RIGHT
        // --------------------------------------------------

        if (event.key === "ArrowRight") {

            event.preventDefault();


            showGalleryImage(
                currentGalleryIndex + 1
            );

        }

    }
);


// ==================================================
// LIGHTBOX NAVIGATION VISIBILITY
// ==================================================

/*
 * 画像が1枚しかない場合は
 * 前後ボタンを表示しない
 */

if (galleryButtons.length <= 1) {

    if (lightboxPrev) {

        lightboxPrev.style.display =
            "none";

    }


    if (lightboxNext) {

        lightboxNext.style.display =
            "none";

    }

}