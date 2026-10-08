@Entry
@Component
export struct Index {
  @State swiperIndex: number = 0
  private swiperController: SwiperController = new SwiperController();

  build() {
    Stack() {
      Swiper(this.swiperController) {
        Column()
          .size({ width: '100%', height: '100%' })
          .backgroundColor(Color.Orange)

        Column()
          .size({ width: '100%', height: '100%' })
          .backgroundColor(Color.Green)

        Column()
          .size({ width: '100%', height: '100%' })
          .backgroundColor(Color.Brown)
      }
      .size({ width: '100%', height: '100%' })
      .loop(false)
      .effectMode(EdgeEffect.None)
      .indicator(false)
      .onAnimationStart((_: number, targetIndex: number, __: SwiperAnimationEvent) => {
        this.swiperIndex = targetIndex
      })

      Column() {
        Row() {
          this.indicatorDot(0)
          this.indicatorDot(1)
          this.indicatorDot(2)
        }
        .margin({ bottom: 16 })
        Row() {
          Button('<')
            .fontSize(16)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .backgroundColor(Color.Blue)
            .borderRadius(16)
            .margin({ bottom: 16, right: 4 })
            .onClick(() => {
              this.swiperController.showPrevious()
            })
          Button('>')
            .fontSize(16)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .backgroundColor(Color.Blue)
            .borderRadius(16)
            .margin({ bottom: 16 })
            .onClick(() => {
              this.swiperController.showNext()
            })
        }
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .size({ width: '100%', height: 40 })
      }

    }
    .size({ width: '100%', height: '100%' })
    .align(Alignment.Bottom)
  }

  @Builder
  indicatorDot(index: number) {
    Image(this.swiperIndex === index ? $r('app.media.startIcon') : $r('app.media.foreground'))
      .size({ width: 20, height: 20 })
      .margin({left: 4, right: 4})
  }
}