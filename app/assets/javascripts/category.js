$(function () {
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category) {
    let html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function childBox(insertHTML) {
    let childBoxHTML = `<div class="sell__main__content__form__box__group__select" id="child_box">
                        <i class="icon-arrow-bottom"></i>
                        <select class="sell__main__content__form__box__group__select__form" id="child_form" name="item[children_category_id]">
                          <option value="">選択してください</option>
                          ${insertHTML}
                      </select>
                      </div>`
    $("#parent_box").after(childBoxHTML);
  }
  // 孫カテゴリーの表示作成
  function grandChildBox(insertHTML) {
    let grandChildBoxHTML = `<div class="sell__main__content__form__box__group__select" id="grandchild_box">
                              <i class="icon-arrow-bottom"></i>
                              <select class="sell__main__content__form__box__group__select__form" id="grandchild_form" name="item[category_id]">
                                <option value="">選択してください</option>
                                ${insertHTML}
                              </select>
                            </div>`
    $("#child_box").after(grandChildBoxHTML);
  }
  // 親カテゴリー選択後のイベント（イベント発火後、子要素のセレクトボックスが出現）
  $(function () {
    $("#category-select-box_list").on('change',"#parent_form", function () {
      let parentValue = $(this).val(); //選択された親カテゴリーの名前を取得
      if (parentValue != "") { //親カテゴリーが初期値でないことを確認
        $.ajax({
            // リクエストを送信する先のURL
            url: "/items/category_children",
            // HTTP通信の種類を記述する
            type: "GET",
            // サーバに送信する値
            data: {
              parent_id: parentValue
            },
            // サーバから返されるデータの型
            dataType: "json"
          })
          // doneはAjax通信が成功したとき,failはAjax通信が失敗したとき
          .done(function (children) {
            $("#child_box").remove();
            $("#grandchild_box").remove();
            let insertHTML = "";
            children.forEach(function (child) {
              insertHTML += appendOption(child);
            });
            childBox(insertHTML);
            $('#parent_form').css('margin', '0');
          }).fail(function () {
            alert("カテゴリー取得に失敗しました");
          })
      } else {
        $("#child_box").remove();
        $("#grandchild_box").remove();
      }
    })
  })
  // 子カテゴリー選択後のイベント（イベント発火後、孫要素のセレクトボックスが出現）
  $(function () {
    $("#category-select-box_list").on('change',"#child_form", function () {
      let childValue = $("#child_form").val();
      if (childValue != "") {
        $.ajax({
          url: "/items/category_grandchildren",
          type: "GET",
          data: {
            child_id: childValue
          },
          dataType: "json"
        }).done(function (grandchilds) {
          $("#grandchild_box").remove()
          let insertHTML = "";
          grandchilds.forEach(function (grandchild) {
            insertHTML += appendOption(grandchild);
          });
          grandChildBox(insertHTML);
          $('#child_form').css('margin', '0');
        }).fail(function () {
          alert("カテゴリー取得に失敗しました");
        })
      } else {
        $("#grandchild_box").remove()
      }
    })
  });
  // 編集画面用
  $(function(){
  // 親が踏まれたとき
    let edit_parent =
      `
        <select class="sell__main__content__form__box__group__select__form" id="parent_form" name="item[parent_category_id]">
          <option value="">選択してください</option>
          <option value="1">レディース</option>
          <option value="2">メンズ</option>
          <option value="3">ベビー・キッズ</option>
          <option value="4">インテリア・住まい・小物</option>
          <option value="5">本・音楽・ゲーム</option>
          <option value="6">おもちゃ・ホビー・グッズ</option>
          <option value="7">コスメ・香水・美容</option>
          <option value="8">家電・スマホ・カメラ</option>
          <option value="9">スポーツ・レジャー</option>
          <option value="10">ハンドメイド</option>
          <option value="11">チケット</option>
          <option value="12">自動車・オートバイ</option>
          <option value="13">その他</option>
        </select>
`

    $(".edit-box").click(function(){
      $("#parent_box").empty();
      $("#child_box").empty();
      $("#grandchild_box").empty();
    $("#parent_box").append(edit_parent);
    });

  });
  
});

