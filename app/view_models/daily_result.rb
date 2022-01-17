class DailyResult
  attr_accessor :title, :date, :amount, :unit, :status

  # statusenum

  def initialize()
    # 支出の合計の配列をもらう？
    # タイトル、日付、値（予定は時間？）、status(予定か日々か支出か)、
    # TODO 予定と日々の結果と支出の結果をそれぞれ共通のクラスで扱えるように設定
    # 初期化
  end

  def sum_expenses
    # その日の支出を足す
  end

  def check_status
    # ステータス(予定か日々か支出か)、
  end
end