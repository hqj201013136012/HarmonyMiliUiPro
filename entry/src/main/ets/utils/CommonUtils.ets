export class CommonUtils {
  public static ipToInt(strIp: string): number {
    // 检查输入是否为空或无效
    if (!strIp || strIp === "0" || strIp === "") {
      return 0;
    }
    // 将 IP 地址按 "." 分割成四个部分
    const parts = strIp.split(".");
    if (parts.length !== 4) {
      throw new Error("Invalid IP address format");
    }
    // 将每个部分转换为整数
    const ip = parts.map(part => {
      const num = parseInt(part, 10);
      if (isNaN(num) || num < 0 || num > 255) {
        throw new Error("Invalid IP address value");
      }
      return num;
    });
    // 将四个部分组合成一个整数
    return (ip[0] << 24) | (ip[1] << 16) | (ip[2] << 8) | ip[3];
  }

  public static intToIp(intIp: number): string {
    // 将整数转换为 IP 地址
    const part1 = (intIp >>> 24) & 0xFF; // 获取最高 8 位
    const part2 = (intIp >>> 16) & 0xFF; // 获取次高 8 位
    const part3 = (intIp >>> 8) & 0xFF;  // 获取次低 8 位
    const part4 = intIp & 0xFF;          // 获取最低 8 位
    return `${part1}.${part2}.${part3}.${part4}`;
  }

}