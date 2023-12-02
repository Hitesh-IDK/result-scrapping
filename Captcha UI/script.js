"use strict";

const captcha_input = document.querySelector(".captcha__input");
const captcha_img = document.querySelector(".captcha_img");
const loader = document.querySelector(".loader");
const loader_text = document.querySelector(".loader_text");

const message = ["i", "n", "g", " ", "d", "a", "t", "a"];

captcha_input.addEventListener("keyup", function (e) {
  const key = e.key;
  if (key === "Enter") {
    captcha_input.blur();
    captcha_input.dataset.isready = "True";
    captcha_input.disabled = true;

    loader.classList.remove("hidden");
    loader_text.classList.remove("hidden");

    let msgCount = 0;
    const messageInterval = setInterval(() => {
      loader_text.textContent = loader_text.textContent + message[msgCount];
      if (msgCount < message.length - 1) msgCount++;
      else {
        clearInterval(messageInterval);
        const dotInterval = setInterval(() => {
          loader_text.textContent = loader_text.textContent + ".";
          if (loader_text.textContent.length > 19) clearInterval(dotInterval);
        }, 500);
      }
    }, 300);
  }
});

captcha_input.focus();
document.querySelector(".usn").textContent = "USN - 4VM21IS001";
