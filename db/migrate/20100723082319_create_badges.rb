class CreateBadges < ActiveRecord::Migration
  def self.up
    create_table :badges do |t|
      t.string :name
      t.string :metal

      t.timestamps
    end
    Badge.create :name => "一应俱全", :metal => "铜"
    Badge.create :name => "兴致盎然", :metal => "银"
    Badge.create :name => "躬耕不辍", :metal => "金"
    Badge.create :name => "初窥门径", :metal => "铜"
    Badge.create :name => "初出茅庐", :metal => "铜"
    Badge.create :name => "略知一二", :metal => "铜"
    Badge.create :name => "非比寻常", :metal => "银"
    Badge.create :name => "所向披靡", :metal => "金"
    Badge.create :name => "出类拔萃", :metal => "铜"
    Badge.create :name => "罕有敌手", :metal => "银"
    Badge.create :name => "一代宗师", :metal => "金"
    Badge.create :name => "牛刀小试", :metal => "铜"
    Badge.create :name => "登堂入室", :metal => "银"
    Badge.create :name => "精深奥妙", :metal => "金"
    Badge.create :name => "秦砖汉瓦", :metal => "银"
    Badge.create :name => "和壁隋珠", :metal => "金"
  end

  def self.down
    drop_table :badges
  end
end
