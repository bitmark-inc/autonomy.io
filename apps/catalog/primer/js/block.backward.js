const pages = 10;
let owl = $('.owl-carousel');
let currentIndex = 0;
// Listen to owl events:
owl.on('changed.owl.carousel', function(event) {
    nextIndex = event.page?.index;
    // Ignore first load
    if (nextIndex === -1) {
        return;
    }
    // Allow navigate from the last to the first
    if (currentIndex === pages -1 && nextIndex === 0) {
        currentIndex = event.page?.index;
        return;
    }
    // Block navigate from the first to the last, and also block backward.
    if ((currentIndex === 0 && nextIndex === pages - 1) || (nextIndex < currentIndex)) {
        owl.trigger("to.owl.carousel", [currentIndex, 100]);
    } else {
        currentIndex = event.page?.index;
    }
})