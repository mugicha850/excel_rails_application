class Customer < ApplicationRecord
    validates :name,
    presence: {massage: "名前を入力して下さい。"}

    validates :number,
    presence: {massage: "電話番号を入力して下さい。"}
end
