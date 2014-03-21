$(function () {
  $('#user_avatar_ctl .avatar').bootstrapFileInput();
  $('#user_avatar_ctl .avatar').fileupload({
    dataType: 'json',
    url: '/profile/avatar',
    formData: function(form) {
      return [{'avatar': $('#user_avatar_ctl .avatar').val()}];
      //return form.serializeArray();
    },
    done: function (e, data) {
      //data.context.text('Upload finished.');
      $('#user_avatar_ctl .file-input-name').hide();
      $('#user_avatar_ctl .preview').attr('src', data.result.file.thumb.url).fadeIn('slow');
      $('#user_avatar').val(data.result.file.thumb.url);
      //alert('hi');
      //alert('done');
    }
  });
});
