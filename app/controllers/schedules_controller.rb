class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[edit update destroy]

  def new
    @schedule = current_user.schedules.build
  end

  def create
    check_label_color_int(schedule_params)
    @schedule = current_user.schedules.build(schedule_params)

    if @schedule.save
      redirect_to calendar_index_path, flash: { blue: '予定を作成しました' }
    else
      flash.now[:red] = '予定の作成に失敗しました'
      render "calendar/index"
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
    params.require(:schedule).permit(:title, :label_color, :date, :time)
  end

  # ラベルカラーの値を数値へ変換
  def check_label_color_int(parameters)
    parameters[:label_color] = parameters[:label_color].to_i
  end
end
