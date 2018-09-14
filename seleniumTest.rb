require 'selenium-webdriver'
require './enquete'
require 'yaml'

config = YAML.load_file("config.yaml")

mail = config["user"]["mail"]
pass = config["user"]["pass"]

puts mail
puts pass

driver = Selenium::WebDriver.for :chrome #使用するブラウザを選択

Enquete.hello
Enquete.say("test dayo")

# LOGIN
driver.navigate.to "https://ssl.pc.moppy.jp/login/" #URL指定

driver.find_element(:name => "mail").send_keys(mail)
driver.find_element(:name => "pass").send_keys(pass)
driver.find_element(:class_name, "a-btn__login").click

# アンケート画面に移動
driver.navigate.to "http://pc.moppy.jp/research/"

Enquete.answer(driver)

sleep(15)

driver.quit #ブラウザを閉じて終了

