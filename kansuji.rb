# coding: utf-8

#
# == オープンクラス
#
class Integer
  #
  # == 数値を漢数字に変換する
  #
  def to_kansuji
    to_s.reverse.scan(/.{1,4}/).map.with_index do |group, i|
      kansuji_group = group.chars.map.with_index do |c, j|
        if digit = Kansuji::DIGIT[c.to_i]
          digit = '' if [1, 2].include?(j) && digit == '一'
          digit + Kansuji::GROUP_SCALE[j].to_s
        end
      end.reverse.join
      kansuji_group + Kansuji::SCALE[i] if kansuji_group != ''
    end.reverse.join
  end
end

#
# == オープンクラス
#
class String
  #
  # == 漢数字を数値に変換する
  #
  def to_number
    result, tmp_group, tmp_digit = 0, 0, 0
    chars.each do |c|
      if digit = Kansuji::DIGIT.find_index(c)
        tmp_digit = digit
      elsif group_scale_pow = Kansuji::GROUP_SCALE.find_index(c)
        tmp_digit = 1 if tmp_digit == 0
        tmp_group += tmp_digit * (10 ** group_scale_pow)
        tmp_digit = 0
      elsif scale_pow = Kansuji::SCALE_FIRST.find_index(c)
        tmp_group += tmp_digit
        tmp_digit = 0
        result += tmp_group * (10000 ** scale_pow)
        tmp_group = 0
      end
    end
    tmp_group += tmp_digit
    result += tmp_group
    result
  end
end

class Kansuji
  DIGIT = [nil].concat(%w(一 二 三 四 五 六 七 八 九)).freeze
  GROUP_SCALE = [nil].concat(%w(十 百 千)).freeze
  SCALE = [''].concat(%w(万 億 兆 京 垓 𥝱 穣 溝 澗 正 載 極 恒河沙 阿僧祇 那由他 不可思議 無量大数)).freeze
  SCALE_FIRST = SCALE.map{|scale| scale.slice(0)}.freeze
end
