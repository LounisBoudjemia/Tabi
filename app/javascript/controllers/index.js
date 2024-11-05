// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

const viewBtn = document.querySelector("#share"),
    popup = document.querySelector(".popup"),
    close = popup.querySelector(".close"),
    field = popup.querySelector(".field"),
    input = field.querySelector("input"),
    copy = field.querySelector("button");


    viewBtn.addEventListener("click", (event) => {
      popup.classList.toggle("show");
    });


    copy.onclick = ()=>{
      input.select(); //select input value
      if(document.execCommand("copy")){ //if the selected text is copied
        field.classList.add("active");
        copy.innerText = "Copied";
        setTimeout(()=>{
          window.getSelection().removeAllRanges(); //remove selection from page
          field.classList.remove("active");
          copy.innerText = "Copy";
        }, 3000);
      }
    }

    btn.addEventListener("click", async () => {
      try {
        await navigator.share(shareData);
        resultPara.textContent = "Trip shared successfully";
      } catch (err) {
        resultPara.textContent = `Error: ${err}`;
      }
    });
