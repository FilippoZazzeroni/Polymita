
// CONST
const CLICK_DONATION_EVENT = "click_donation_event";

function gtag() {
    dataLayer.push(arguments);
    console.debug(arguments);
}

function onClickDonation() {
    gtag(CLICK_DONATION_EVENT)
}


window.dataLayer = window.dataLayer || [];

gtag('js', new Date());
gtag('config', 'G-XTZB9Q169H', { debug_mode: true });

document.addEventListener("DOMContentLoaded", () => {
    console.log("doc loaded");

    buttons = document.querySelectorAll(".animated-button");
    buttons.forEach(element => {
        ref = element.href;
        element.addEventListener("click", (e) => {
            e.preventDefault();
            if (ref != undefined) {
                window.open(ref, "_blank");
                gtag("animated button clicked", {
                    link: ref
                });
            }
        });
    });

    topBarButton = document.querySelectorAll(".top-bar-button");
    topBarButton.forEach(element => {
        console.log(element)
    });

    const menuBtn = document.getElementById("menu-button");
    const menu = document.getElementById("main-menu");

    menuBtn.addEventListener("click", () => {
        menu.classList.toggle("open");
    });
})

function buttonClicked(link) {
    topBarButton = document.querySelectorAll(".top-bar-button");
    window.open(link, "_blank");
}

function scrollToSection(section) {
    document.getElementById(section).scrollIntoView({ behavior: "smooth", block: "start", inline: "nearest" });
}

function scrollToSectionCloseMenu(section) {
    document.getElementById(section).scrollIntoView({ behavior: "smooth", block: "start", inline: "nearest" });
    document.getElementById("main-menu").classList.toggle("open");
}