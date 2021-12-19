class SchedulesController < ApplicationController
  include Common
  before_action :set_schedule, only: %i[edit update destroy]

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = current_user.schedules.build(check_params_int(schedule_params))
    if @schedule.save
      # 登録成功時リダイレクト
      # フラッシュメッセージ
    else
      # フラッシュメッセージ
      render :new
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  # スケジュール情報編集ダイアログ表示
  def edit; end

  def update
    if @schedule.update(schedule_params)
      # フラッシュメッセージ
      # 更新成功時リダイレクト
    else
      # フラッシュメッセージ
      render :edit
    end
  end

  def destroy
    @schedule.destroy!
    # フラッシュメッセージとリダイレクト処理
  end

  private

  # スケジュール情報取得
  def set_schedule
    @schedule = current_user.schedules.find(params[:id])
  end

  # ストロングパラメータ
  def schedule_params
    params.require(:schedule).permit(:title, :time, :labelColor, :date)
  end

  def check_params_int(parameters)
    parameters.each do |key, value|
      if integer_string?(value)
        parameters[key] = value.to_i
      end
    end
  end
end
