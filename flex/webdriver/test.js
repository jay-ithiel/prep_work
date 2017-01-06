"use strict";

const webdriver = require('selenium-webdriver');
const browser = new webdriver.Builder().usingServer().withCapabilities({
	'browserName': 'chrome'
}).build();

function logTitle() {
	browser.getTitle().then(function(title) {
		console.log('Current Page Title: ' + title);
	});
}

function clickLink(link) {
	link.click();
}

function handleFailure(err) {
	console.error('Something went wrong\n', err.stack, '\n');
	closeBrowser();
}

function findTutsPlusLink() {
	return browser.findElements(
		webdriver.By.css('[href="http://code.tutsplus.com/"]')
	).then(function(result) {
			return result[0];
		}
	);
}

function closeBrowser() {
	// browser.quit();
}

browser.get('https://www.google.com');
browser.findElement(webdriver.By.name('q')).sendKeys('hello');
browser.findElement(webdriver.By.name('btnK')).click();
browser.wait(
	findTutsPlusLink, 2000
).then(
	logTitle
).then(
	closeBrowser, handleFailure
);
