module Enquete
	def self.hello
		puts "Hello!"
	end

	def self.say(message)
		puts message
	end

	def self.answer(driver)
		driver.find_element(:class_name, "ga-answerBtn").click
	end
end
