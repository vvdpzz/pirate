class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.references :user
      t.string :title
      t.text :body
      t.references :answer, :default => 0
      # correct answer ID
      t.integer :status, :default => 0
      # 0 -> normal
      # 1 -> closed
      # 2 -> reopen
      # 3 -> delete
      t.integer :featured, :default => 0
      # featured = featured.to_i if featured > 0
      t.integer :views, :default => 0

      t.timestamps
    end
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "谷歌未能按期履行洛杉矶市软件提供合约", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
    Question.create :user_id => 1, :tag_list => "GSM,开源,加密算法,破解", :title => "开源GSM加密算法破解软件发布", :body => "谷歌在赢得向洛杉矶市政府提供邮件与协作软件的高额订单后，错过了6月30日这一软件全面运行最终期限，因对该公司软件安全的关注加剧。"
  end

  def self.down
    drop_table :questions
  end
end
