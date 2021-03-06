// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

//= require active_admin/base

$(function () {
  // 画像を呼び出すためのコールバック関数
  function readURL(input) {
    // データが存在していることを確認
    if (input.files && input.files[0]) {
      // 非同期で読み込むためにFileReader()を呼び出す
      var reader = new FileReader();
      // onload はファイルの読み込みが完了したタイミングで発火する
      reader.onload = function (e) {
        // avatar_img_prevのimg srcの部分を画像のパラメータとして設定
        $('#prev_img').attr('src', e.target.result);
      }
      // ファイルを読み込む
      reader.readAsDataURL(input.files[0]);
    }
  }

  // post_imgが変更されたタイミングに発火
  $("#post_img").change(function () {
    readURL(this);
  });
});


$(window).scroll(function() {
 $(".animation .anm_mod").each(function() {
  const position = $(this).offset().top;
  const scroll = $(window).scrollTop();
  const windowHeight = $(window).height();
  if (scroll > position - windowHeight) {
   $(this).addClass("active");
  }
  if (scroll < 100) {
   $(this).removeClass("active");
  }
 });
});

$(function() {
 $('a[href^="#"]').click(function() {
  const speed = 600;
  const href = $(this).attr("href");
  const target = $(href == "#" || href == "" ? "html" : href);
  const position = target.offset().top;
  $("html, body").animate({ scrollTop: position }, speed, "swing");
  return false;
 });
});

$(function() {
  $('#post_index').css('display', 'none').fadeIn(400);
});

$(function() {
  $('#main').css('display', 'none').fadeIn(1000);
});

$(function() {
  $('#toppage').css('display', 'none').fadeIn(800);
});
