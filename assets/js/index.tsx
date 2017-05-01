import * as $ from 'jquery';

function addRippleClass(name): void {
    let elements: NodeListOf<Element> = document.getElementsByClassName(name);
    console.log(elements);
    let classes: DOMTokenList = elements[0].classList;
    console.log(classes);
    classes.add("rippling");
}

$(document).ready(function(){
    'use strict';
    console.log("starting");


    var $mainButton = $(".main-button"),
        $closeButton = $(".close-button"),
        $buttonWrapper = $(".button-wrapper"),
        $ripple = $(".ripple"),
        $layer = $(".layered-content");


    $mainButton.on("click", function(){
        console.log("clicked");
        addRippleClass("ripple");
        // $ripple.addClass(function (index) {
        //     console.log("HERLERLJ");
        //     return "rippling"
        // });
        $buttonWrapper.addClass("clicked");
        setTimeout(function(){
            $layer.addClass("active");
        }, 1500);
    });

    $closeButton.on("click", function(){
        $buttonWrapper.removeClass("clicked");
        $ripple.removeClass("rippling");
        $layer.removeClass("active");
    });

}());