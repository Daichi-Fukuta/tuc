# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = %w(明治大学 青山学院大学 立教大学 中央大学 法政大学 日本大学 東洋大学 駒沢大学 専修大学)

categories.each do |category|
  Category.create(name: category)
end


states = %w(新品・未使用 未使用ではないが書き込みや汚れがない やや書き込みや汚れがある 書き込みや汚れあり 全体的に状態が悪い)

states.each do |state|
  State.create(state: state)
end

postages = %w(送料込み(出品者負担) 着払い(購入者負担))

postages.each do |postage|
  Postage.create(postage: postage)
end

regions = %w(北海道 青森県 岩手県 宮城県 秋田県 山形県 福島県 茨城県 栃木県 群馬県 埼玉県 千葉県 東京都 神奈川県 新潟県 富山県 石川県 福井県 山梨県 長野県 岐阜県 静岡県 愛知県 三重県 滋賀県 京都府 大阪府 兵庫県 奈良県 和歌山県 鳥取県 島根県 岡山県 広島県 山口県 徳島県 香川県 愛媛県 高知県 福岡県 佐賀県 長崎県 熊本県 大分県 宮崎県 鹿児島県 沖縄県)

regions.each do |region|
  Region.create(region: region)
end

shipping_dates = ['1~2日で発送', '2~3日で発送', '4~7日で発送']

shipping_dates.each do |shipping_date|
  ShippingDate.create(shipping_date: shipping_date)
end

genders = %w(男 女)

genders.each do |gender|
  Gender.create(gender: gender)
end


