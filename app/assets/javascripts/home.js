$(document).on('turbolinks:load', () =>
  $('.slide-show').slick({
    fade: true,
    cssEase: 'linear',
    autoplay: true,
    autoplaySpeed: 4000
  })
);