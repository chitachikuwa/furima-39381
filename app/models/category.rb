class Category < ActiveHash::Base
  self.data = [
    {id: 0, name: '---'},{id: 1, name: 'メンズ'}, {id: 2, name:'レディース'}, {id: 3, name: 'ベビー・キッズ'}, {id: 4, name: 'インテリア'}, {id: 5, name: '住まい・小物'},
    {id: 6, name: '本・音楽・ゲーム'}, {id: 7, name: 'おもちゃ・ボビー・グッズ'}, {id: 8, name: '家電・スマホ・カメラ'}, {id: 9, name: 'レジャー'}, {id: 10, name: 'ハンドメイド'}, {id: 11, name: 'その他'}
   ]
end   