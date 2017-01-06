require 'selenium-webdriver'

DRIVER = Selenium::WebDriver.for :chrome

def click_link(link)
  link.click
end

def handle_failure(err)
  p "Something went wrong"
end

def closeBrowser
  DRIVER.quit
end

def find_jobs
  sleep(2)
  DRIVER.find_element(id: "KeywordSearch").send_keys('software engineer')

  location = DRIVER.
end

DRIVER.get("https://www.glassdoor.com/index.htm")
sleep(2)
find_jobs
