import List from '@ohos.util.List'
export default function getDataList() {
  const list: object[] = []
  for (let i = 0; i < 30; i++) {
    list.push({
      image: 'https://img-ucdn-static.helijia.com/zmw/upload/20170315/ef4e14bbe53141b68424e38de508408d.cover_pic!/0/w-240/format-webp',
      text: `好了 时里是有有有有有 ${i}`
    })
  }
  return list
}