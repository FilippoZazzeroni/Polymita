window.addEventListener("DOMContentLoaded", () => {
    const track = document.querySelector('.carousel-track');
    const slides = document.querySelectorAll('.slide');
    const prevBtn = document.querySelector('.carousel-button.prev');
    const nextBtn = document.querySelector('.carousel-button.next');
    const dotsContainer = document.querySelector('.carousel-dots');

    let currentSlide = 0;

    function updateSlidePosition() {
        const slideWidth = slides[0].offsetWidth;
        track.style.transform = `translateX(-${currentSlide * slideWidth}px)`;
        updateActiveDot();
    }

    function updateActiveDot() {
        document.querySelectorAll('.carousel-dot').forEach((dot, index) => {
            dot.classList.toggle('active', index === currentSlide);
        });
    }

    // Create dots
    slides.forEach((_, index) => {
        const dot = document.createElement('div');
        dot.classList.add('carousel-dot');
        if (index === 0) dot.classList.add('active');
        dot.addEventListener('click', () => {
            currentSlide = index;
            updateSlidePosition();
        });
        dotsContainer.appendChild(dot);
    });

    // Navigation buttons
    nextBtn.addEventListener('click', () => {
        if (currentSlide < slides.length - 1) {
            currentSlide++;
            updateSlidePosition();
        }
    });

    prevBtn.addEventListener('click', () => {
        if (currentSlide > 0) {
            currentSlide--;
            updateSlidePosition();
        }
    });

    const detailOverlay = document.getElementById("slide-detail");
    const closeDetail = document.getElementById("close-detail");

    closeDetail.addEventListener("click", () => {
        detailOverlay.classList.remove("active");
        // hideShowSlide("polylandia-section", false);
        hideShowSlide("school-section", false);
    });

    // Handle resizing
    window.addEventListener('resize', updateSlidePosition);

    loadSectionFile("src/pages/polylandia_section.html", "polylandia-section");
    loadSectionFile("src/pages/school_section.html", "school-section");
})

function loadSectionFile(section, sectionId) {
    fetch(section)
        .then((val) => val.text())
        .then((text) => document.getElementById(sectionId).innerHTML = text)
        .then(() => {
            hideShowSlide(section, false);
        });
}

function hideShowSlide(section, isOverlayMode) {
    console.log(section);
    const sectionItems = document.getElementsByName("detail");
    Array.from(sectionItems.values()).forEach((element) => {
        console.log(element);
        element.style.display = isOverlayMode ? "block" : "none";
    });
    const sectionCardItems = document.getElementsByName("card");
    Array.from(sectionCardItems.values()).forEach((element) => {
        console.log(element);
        element.style.display = !isOverlayMode ? "flex" : "none";
    });

    document.querySelectorAll(".slide-content").forEach((elemet) => {
        if (window.innerWidth < 600) {
            elemet.style.width = "100%";
        } else {
            elemet.style.width = isOverlayMode ? "100%" : "50%";
        }
    })
}

function showOverlay(index, section) {
    const slide = document.querySelectorAll(".slide")[index];
    console.log(slide);
    const slideClone = slide.cloneNode(true);
    const detail = document.getElementById("detail-body");
    detail.innerHTML = "";
    detail.appendChild(slideClone);
    const detailOverlay = document.getElementById("slide-detail");
    detailOverlay.classList.add("active");
    hideShowSlide(section, true);
}