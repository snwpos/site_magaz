$(document).ready(()=>{
    $(".addToFavorite").click((event)=>{
        event.preventDefault();
        
        var clothID = event.currentTarget.attributes['data-cloth'].value;
        var url = `http://127.0.0.1:8000/main/favorite/ad/${clothID}`;
        $.ajax({
            
            url: url,
            method: `POST`,
            headers: {
                "x-csrf-token": $("input[name='csrfmiddlewaretoken']").val(),
                contentType: 'application/json',
                
            },
            data: {
                
            
            },
            success: () => {
                
                alert("Работает")
            },
            error: () => {
                
                alert("Ошибочка")
            }
        })


        // alert("");
    });
})