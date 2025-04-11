
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
gtag('config', 'G-8QBTWSSDFQ', { debug_mode: true });

document.addEventListener("DOMContentLoaded", () => {
    console.log("doc loaded");

    buttons = document.querySelectorAll(".animated-button");
    buttons.forEach(element => {
        ref = element.href;
        element.addEventListener("click", (e) => {
            e.preventDefault();
            window.open(ref, "_blank");
            gtag("animated button clicked", {
                link: ref
            });
        });
    });
})