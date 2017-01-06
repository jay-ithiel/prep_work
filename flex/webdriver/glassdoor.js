"use strict";

const webdriver = require('selenium-webdriver');
const browser = new webdriver.Builder().usingServer().withCapabilities({
  'browserName': 'chrome'
}).build();

function logTitle() {

}

function clickLink(link) {
  link.click();
}

function handleFailure(err) {
  console.error('Something went wrong\n', err.stack, '\n');
}

function closeBrowser() {
  browser.quit();
}

function findJobs() {
  browser.findElement(webdriver.By.name('sc.keyword')).sendKeys(
    'software engineer'
  );

  let location = browser.findElement(webdriver.By.id('LocationSearch'));
  location.clear();
  location.sendKeys(
    'San Francisco, CA'
  );

  return browser.findElement(webdriver.By.className('search')).click();
}

function clickJobs() {
  console.log('inside clickJobs');
  browser.findElements(webdriver.By.className("jobListing")).then(elements => {
    elements.forEach((element, i) => {
      if (i > 0) { return; }
      console.log('inside element.forEach');

      element.click();
      console.log('after click');

      setTimeout(() => {
        browser.findElement(webdriver.By.className('mfp-close')).click();
      }, 1000);

      setTimeout(() => {
        let applyButton = browser.findElement(
          webdriver.By.css('[href="#easy-apply-module"]')
        );
        applyButton.click();
      }, 5000);
    });
  });
}

browser.get('https://www.glassdoor.com/index.htm');
setTimeout(findJobs, 5000);
setTimeout(clickJobs, 35000);
