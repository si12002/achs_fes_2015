jQuery(document).bind('mobileinit', function () {
  // console.log('mobileinit');
  jQuery.extend(jQuery.mobile, {
    loadingMessage: 'ロード中',
    pageLoadErrorMessage: 'ページの読み込みに失敗しました',
    ajaxEnabled: false
  });
});
