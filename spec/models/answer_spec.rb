require 'spec_helper'

describe "Answer" do
  let(:user) { User.new(email: "Foo@goo.org") }
  let(:question) { user.questions.new(title: "Is this?", content: "I am too happy")}
  let(:answeruser) {User.create(email: "happy@gmail.com")}
  let(:useranswer) {answeruser.answers.create(content:"be more sad")}
  let(:answer) { question.answers.new(content: "That's simply wrong.")}
  let(:nocontent) { Answer.new }

  it "has content" do
    expect(answer.content).to eq("That's simply wrong.")
  end

  it "is associated with a question" do
    expect(answer.question).to eq(question)
  end

  it "raises error if there's no content" do
    expect{ nocontent.save! }.to raise_error
  end

  it "is associated with a user" do
    expect(useranswer.user).to eq(answeruser)
  end

end
