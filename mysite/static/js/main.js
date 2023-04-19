$(document).ready(()=>{
    $(".addToCart").click((event)=>{
        event.preventDefault();
        
        var clothID = event.currentTarget.attributes['data-cloth'].value;
        var price = $(`#price${clothID}`).text().replace(',', '.');
        var url = `/main/cart/add/${clothID}`;
        var csrftoken = $('input[name="csrfmiddlewaretoken"]').val();

        $.ajax({
            
            id: clothID,
            method: `POST`,
            headers: {
                "X-CSRFToken": csrftoken
            },
            data: {
                "quantity_buying": 1,
                "price": price
            },
            success: () => {
                alert("Товар добавлен")
            },
            error: () => {
                alert("Ошибочка")
            }
        })
    });
})
