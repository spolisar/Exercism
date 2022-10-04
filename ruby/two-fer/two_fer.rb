=begin
Write your code for the 'Two Fer' exercise in this file. Make the tests in
`two_fer_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/two-fer` directory.
=end


class TwoFer
    def self.two_fer(name='you')
        "One for #{name}, one for me."
    end
end

# below doesn't work since TwoFer hasn't been defined
# def TwoFer.two_fer(name='you')
#     "One for #{name}, one for me."
# end