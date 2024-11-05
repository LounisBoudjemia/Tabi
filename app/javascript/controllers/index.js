// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

const viewBtn = document.querySelector("#trip-icon-share"),
    popup = document.querySelector(".popup"),
    close = popup.querySelector(".close"),
    field = popup.querySelector(".field"),
    input = field.querySelector("input"),
    copy = field.querySelector("button");


    viewBtn.addEventListener("click", (event) => {
      popup.classList.toggle("show");
    });

    close.addEventListener("click", (event) => {
      close.close();
    });


    copy.addEventListener("click", (event) => {
     if (input.select()); //select input value
      navigator.clipboard.writeText(input.value);
      field.classList.add("active");
      copy.innerText = "Copied";
      setTimeout(()=>{
        window.getSelection().removeAllRanges(); //remove selection from page
        field.classList.remove("active");
        copy.innerText = "Copy";
      }, 3000);
    });

    // copy.addEventListener("click", (event) => {
    //   input.select(); //select input value
    //   if(document.execCommand("copy")){ //if the selected text is copied
    //     field.classList.add("active");
    //     copy.innerText = "Copied";
    //     setTimeout(()=>{
    //       window.getSelection().removeAllRanges(); //remove selection from page
    //       field.classList.remove("active");
    //       copy.innerText = "Copy";
    //     }, 3000);
    //   }
    // });
