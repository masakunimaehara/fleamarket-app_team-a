$(function(){
  let fileIndex = 1
  const buildFileField = (num)=> {
    const html = `<div class="js-file_group" data-index="${num}">
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${num}][image]"
                    id="item_item_images_attributes_${num}_image">
                    <span class="js-remove">削除</span>
                  </div>`;
    fileIndex += 1
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  // let fileIndex = [1,2,3,4,5,6,7,8,9];
  // lastIndex = $('.js-file_group:last').data('index');
  // fileIndex.splice(0, lastIndex);


  $('.hidden-destroy').hide();
  
  $('#image-box').on('change', '.js-file', function(e) {
    
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];


    if(!file){
      $(`.js-file_group[data-index=${targetIndex}]`).find(".js-remove").trigger("click");
      return false;
    }
    
      var blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  
      $('#previews').append(buildImg(targetIndex, blobUrl));
    let limitFileField = $(".js-file_group:last").data("index");
    
    if($(".js-file_group").length >= 10 ){
      return false;
    } else {
      $('#image-box').append(buildFileField(fileIndex));

      // fileIndex.shift();
      // fileIndex.push(fileIndex[fileIndex.length - 1] )
    }
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    let limitFileField = $(".js-file_group:last").data("index");
    const targetIndex = $(this).parent().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    if (targetIndex == limitFileField ) $('#image-box').append(buildFileField(fileIndex));
    if ($(".js-file_group").length >= 9)  $('#image-box').append(buildFileField(fileIndex));
  });
});

