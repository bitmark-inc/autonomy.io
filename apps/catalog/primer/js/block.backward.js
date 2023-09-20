const pages = 10;
let owl = $('.owl-carousel');
let currentIndex = 0;
const backgroundColorCode = ['#000000', '#EA0028', '#FF595A', '#FFB4AB', '#FE9014', '#FFCD01', '#CCDB00', '#00AE41', '#87E2D1', '#00ACD9', '#0056B8'];
// Listen to owl events:
owl.on('changed.owl.carousel', function(event) {
    nextIndex = event.page?.index;
    //Update background color base on index of slide
    $('.page').css('background-color', backgroundColorCode[nextIndex]);
    // Ignore first load
    if (nextIndex === -1) {
        return;
    }
    // Allow navigate from the last to the first
    if (currentIndex === pages -1 && nextIndex === 0) {
        currentIndex = event.page?.index;
        return;
    }
    // Block navigate from the first to the last.
    if ((currentIndex === 0 && nextIndex === pages - 1)) {
        owl.trigger("to.owl.carousel", [currentIndex, 100]);
    } else {
        currentIndex = event.page?.index;
    }
})