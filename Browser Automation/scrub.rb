require 'selenium-webdriver'

#Example formatting for windows (commented out since I use a mac)
#chromedriver_path = "c:\\Users\\[user]\\[folder path]\\chromedriver.exe"
#Example formatting for mac
chromedriver_path = "\/Users\/[user]\/Desktop\/scripting-tutorial\/chromedriver"

Selenium::WebDriver::Chrome.driver_path = chromedriver_path
driver = Selenium::WebDriver.for :chrome

driver.get 'https://corporate.comcast.com/company/leadership'
 
p "Running script..."
driver.find_elements(:css => '.list-people__sub-text--anchor').each do |elem|

    link = elem.attribute("href")
    driver2 = Selenium::WebDriver.for :chrome

    driver2.get link
    p driver2.title
    if driver2.page_source.include?("Oregon State")
      p '=====================   match ' + driver2.title.to_s
    end
    driver2.quit
end

driver.quit
