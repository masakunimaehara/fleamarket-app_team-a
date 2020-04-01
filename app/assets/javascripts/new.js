$(document).on(function() {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div class="js-file_group" data-index="${index}">
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${index}][image]" 
                    id="item_item_images_attributes_${index}_image">
                    <span class="js-remove">削除</span>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e){
    $('#imagebox').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    if ($('.js-file').length == 0 ) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});