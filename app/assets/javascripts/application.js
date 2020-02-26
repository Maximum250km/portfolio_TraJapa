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
//= require bxslider
//= require bootstrap-sprockets
//= require_tree .

// user new における国旗選択jquery

// post/index におけるtop選択
// $(document).ready(function(){
//   $('.bxslider').bxSlider({
//     auto: false,           // 自動スライド
//     speed: 1000,          // スライドするスピード
//     moveSlides: 1,        // 移動するスライド数
//     pause: 3000,          // 自動スライドの待ち時間
//     maxSlides: 1,         // 一度に表示させる最大数
//     slideWidth: 600,      // 各スライドの幅
//     randomStart: false,    // 最初に表示するスライドをランダムに設定
//     autoHover: true,       // ホバー時に自動スライドを停止
//     touchEnabled:false
//   });
// });

// post/newにおけるautocomplete

var searchInput = 'search_input';
$(document).ready(function () {
  var autocomplete;
  autocomplete = new google.maps.places.Autocomplete((document.getElementById(searchInput)), {
    types: ['geocode'],
    componentRestrictions: {country: "jp"}
  });
  google.maps.event.addListener(autocomplete, 'place_changed', function () {
    var near_place = autocomplete.getPlace();
    document.getElementById('loc_lat').value = near_place.geometry.location.lat();
    document.getElementById('loc_long').value = near_place.geometry.location.lng();
    document.getElementById('latitude_view').innerHTML = near_place.geometry.location.lat();
    document.getElementById('longitude_view').innerHTML = near_place.geometry.location.lng();
  });
});

// tizu
function initMap() {
  var target = document.getElementById('gmap');
  var address = document.getElementById("spot").textContent;
  //ジオコーディングのインスタンスの生成
  var geocoder = new google.maps.Geocoder();

    geocoder.geocode({ address: address }, function(results, status){
        //ステータスが OK で results[0] が存在すれば、地図を生成
      if (status === 'OK' && results[0]){
        var map = new google.maps.Map(target, {
        //results[0].geometry.location に緯度・経度のオブジェクトが入っている
         center: results[0].geometry.location,
         zoom: 17
         });
           var marker = new google.maps.Marker({
            position: results[0].geometry.location,
            map: map,
            animation: google.maps.Animation.DROP
          });
        }else{
           //ステータスが OK 以外の場合や results[0] が存在しなければ、アラートを表示して処理を中断
           //下の記述でエラーの出し方を定義している。 今回は非表示にするためコメントアウト
           //alert('失敗しました。理由: ' + status);
           //return;
         }
       });
      }
