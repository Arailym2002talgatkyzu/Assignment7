<%--
  Created by IntelliJ IDEA.
  User: arail
  Date: 10/20/2020
  Time: 10:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>E-Commerce</title>
    <link rel="stylesheet" type="text/css" href="main.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
            crossorigin="anonymous"></script>
    <script type="text/javascript">
        var stationary=document.getElementsByClassName("stationaryItems");
        var gadgets=document.getElementsByClassName("gadgetItems");
            function showStationary(){
            for(var i=0; i<stationary.length; i++){
                stationary[i].style.display="block";
            }
            for(var i=0; i<gadgets.length; i++){
                gadgets[i].style.display="none";
            }
        }
        function showGadgets(){
            for(var i=0; i<stationary.length; i++){
                stationary[i].style.display="none";
            }
            for(var i=0; i<gadgets.length; i++){
                gadgets[i].style.display="block";
            }
        }
    </script>
    <script type="text/javascript">
        function addToCard(product) {
        product=$(product).text()
            $.ajax({
                url:'addingCard',
                type: "POST",
                data: {product:product},
                accepts:"application/json;charset=UTF-8",
                success: function(data){

                    if(data.msg=="error"){
                        $("#card").append("<p> Something went wrong!</p>");
                    }
                    else{
                        var product=data
                        for(let i=0; i<data.length;i++){
                            $("#card").append(
                                "<p style='font-size: 25px;\n" +
                                "    color: crimson;'>"+product[i]+"</p>"
                            );
                        }
                    }
                }
            })
        }
    </script>
</head>
<body>
<div class="flex-container">
    <div class="stationary">
        <button type="button" id="stbtn" onclick="showStationary()">STATIONARY</button>
        <div class="stationaryItems" >

            <img class="item-image" src="notepad.jpg" ><br>
            <span class="item-title" name="item_name" id="productOne">Notepad</span><br>
            <span class="item-price" name="item_price">$10</span><br>
            <button class="item-button" name="add_item" onclick="addToCard('#productOne')">ADD TO CARD</button>

        </div>

        <div class="stationaryItems">

            <img class="item-image" src="stepler.jpg" ><br>
            <span class="item-title"  name="item_name" id="productTwo">Stepler</span><br>
            <span class="item-price" name="item_price">$23</span><br>
            <button class="item-button"name="add_item" onclick="addToCard('#productTwo')" >ADD TO CARD</button>

        </div>

        <div class="stationaryItems">

            <img class="item-image" src="pencil.jpg"><br>
            <span class="item-title" name="item_name" id="productThree">Color Peps</span><br>
            <span class="item-price"name="item_price">$15</span><br>
            <button class="item-button"name="add_item" onclick="addToCard('#productThree')">ADD TO CARD</button>

        </div>

    </div>

    <div class="gadgets">

        <button type="button" id="gtbtn" onclick="showGadgets()">GADGETS</button>
        <div class="gadgetItems">

            <img class="item-image" src="iphone.jpg"><br>
            <span class="item-title" name="item_name"id="productFour">IPhone 11 Pro</span><br>
            <span class="item-price"name="item_price">$1,299</span><br>
            <button class="item-button"name="add_item"onclick="addToCard('#productFour')">ADD TO CARD</button>

        </div>

        <div class="gadgetItems">

            <img class="item-image" src="planshet.jpg"><br>
            <span class="item-title" name="item_name" id="productFive">Tablet</span><br>
            <span class="item-price"name="item_price">$310</span><br>
            <button class="item-button"name="add_item"onclick="addToCard('#productFive')">ADD TO CARD</button>

        </div>

        <div class="gadgetItems">

            <img class="item-image" src="laptop.jpg"><br>
            <span class="item-title" name="item_name" id="productSix">Laptop</span><br>
            <span class="item-price"name="item_price">$1,214</span><br>
            <button class="item-button"name="add_item"onclick="addToCard('#productSix')">ADD TO CARD</button>

        </div>
    </div>


</div>
<div class="userCard" style=" background-color: white;
    border-radius: 10px;
    text-align: center;
    padding: 50px;
    width: 800px;
    margin-left: 25%;">
    <h1 style="color: blue; margin-bottom: 5%"><b>Card</b></h1>
    <div id="card">

    </div>
    <form action="confirmation.jsp"><input type="submit" value="BUY" style="background-color: green; padding: 10px; margin-top: 5%" ></form>
</div>

</body>
</html>
