$(document).ready(()=>{
    var selectclothID = 0;
    $(".addToFav").click((event)=>{
        event.preventDefault();

        var url = `/myapp/cart/favorite/add/${selectclothID}`;
        $.ajax({

            url: url,
            method: `POST`,
            headers: {
                "x-csrf-token": $("input[name='csrfmiddlewaretoken']").val(),
                contentType: 'application/json',

            },
            success: (response) => {
                if (response.success == true) {
                    $('#addToFavModal').modal('hide');
                    $('#favSuccessModal').modal('show');
                }
                else {
                    alert('Не добавлена')
                }

            },
            error: () => {

                alert("Ошибочка")
            }
        });

    });
    
    $(".favorite").click((event) => {
        selectclothID = event.currentTarget.attributes['data-cloth'].value

        $('#addToFavModal').modal('show');

    });
})