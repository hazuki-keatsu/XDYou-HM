export interface ClassTableDetailRouterParam {
  id: number;
  name: string;
}

@Builder
export function ClassTableDetailPageBuilder() {
  ClassTableDetailPage()
}

@Entry
@Component
struct ClassTableDetailPage {
  build() {
    NavDestination() {
      Column() {
        Text(`详情页`)
          .fontSize(20)
          .margin(20);
      }
    }
    .title("详情页")
  }
}