import { hilog } from "@kit.PerformanceAnalysisKit";

@Component
export struct TimeLineCard {
  @Prop nowClass: string = "";
  @Prop fontColor: Color = Color.Black;
  @Prop laterClasses: Array<string> = [];
  @Prop bgColor: Color = Color.Transparent;

  @Builder
  moreClassBuilder(className: string) {
    Row() {
      Line()
        .width(18)
        .height(28)
        .startPoint([9, 4])
        .endPoint([9, 28])
        .stroke(this.fontColor)
        .strokeWidth(4)
        .strokeLineCap(LineCapStyle.Square)
      Text(className)
        .padding({ left: 10, top: 4 })
        .fontSize(20)
        .fontColor(this.fontColor)
    }
    .alignItems(VerticalAlign.Top)
  }

  build() {
    Column() {
      Row() {
        Image($rawfile('icons/timer.svg'))
          .width(20)
          .height(20)
          .fillColor(this.fontColor)
        Text($r('app.string.Home_page_Time_line_card_Current'))
          .padding({ left: 8 })
          .fontSize(12)
          .fontColor(this.fontColor)
      }
      .alignItems(VerticalAlign.Bottom)

      Row() {
        Line()
          .width(18)
          .height(36)
          .startPoint([9, 4])
          .endPoint([9, 34])
          .stroke(this.fontColor)
          .strokeWidth(4)
          .strokeDashArray([2, 10])
          .strokeLineCap(LineCapStyle.Square)
        Text(this.nowClass)
          .padding({ left: 10, top: 4 })
          .fontSize(20)
          .fontColor(this.fontColor)
      }
      .alignItems(VerticalAlign.Top)

      Row() {
        Image($rawfile('icons/clock.svg'))
          .width(20)
          .height(20)
          .fillColor(this.fontColor)
        Text($r('app.string.Home_page_Time_line_card_More'))
          .padding({ left: 8 })
          .fontSize(12)
          .fontColor(this.fontColor)
      }
      .alignItems(VerticalAlign.Bottom)

      ForEach(
        this.laterClasses,
        (className: string) => {
          this.moreClassBuilder(className);
        },
        (className: string, index: number) => `later-class-${index}-${className}`
      )
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .padding(16)
    .backgroundColor(this.bgColor)
    .borderRadius(16)
  }
}