$(document).ready(()=>{
    $(".addToCart").click((event)=>{
        event.preventDefault();
        
        var clothID = event.currentTarget.attributes['data-cloth'].value;
        var price = $(`#price${clothID}`).text().replace(',', '.');
        var url = `http://127.0.0.1:8000/main/cart/add/${clothID}`;
        $.ajax({
            
            url: url,
            method: `POST`,
            headers: {
                "x-csrf-token": $("input[name='csrfmiddlewaretoken']").val(),
                contentType: 'application/json',
                
            },
            data: {
                "quantity_buying": 1,
                "price": price
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