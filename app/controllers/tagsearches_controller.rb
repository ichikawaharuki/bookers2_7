class TagsearchesController < ApplicationController
  def search
    @model = Book  #search機能とは関係なし
    @word = params[:content]
    @books = Book.where("category LIKE?","%#{@word}%")
    render "tagsearches/tagsearch"
  end
end

#モデルクラス.where("列名 LIKE ?", "%値%")   値(文字列)を含む
#モデルクラス.where("列名 LIKE ?", "値_")    値(文字列)と末尾の1文字
#ワイルドカードとは、任意の文字列を指定するときに使う「%」や「_」などの特殊文字のこと

#「%」・・・0文字以上の任意の文字列

#「_」・・・任意の1文字