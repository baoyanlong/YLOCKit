//
//  YLIPAddressUtils.m
//  YLOCKit
//
//  Created by 包燕龙 on 2022/4/19.
//

#import "YLIPAddressUtils.h"
#import <sys/utsname.h>
#import <sys/socket.h>
#import <sys/sockio.h>
#import <sys/ioctl.h>
#import <net/if.h>
#import <arpa/inet.h>

@implementation YLIPAddressUtils

/// 获取设备IP地址
+ (NSString *)getDeviceIPAddress {
    int sockfd = socket(AF_INET,SOCK_DGRAM, 0);
    NSMutableArray *ips = [NSMutableArray array];
    int BUFFERSIZE = 4096;
    struct ifconf ifc;
    char buffer[BUFFERSIZE], *ptr, lastname[IFNAMSIZ], *cptr;
    struct ifreq *ifr, ifrcopy;
    ifc.ifc_len = BUFFERSIZE;
    ifc.ifc_buf = buffer;
    if (ioctl(sockfd,SIOCGIFCONF, &ifc) >= 0){
        for (ptr = buffer; ptr < buffer + ifc.ifc_len; ){
            ifr = (struct ifreq *)ptr;
            int len =sizeof(struct sockaddr);
            if (ifr->ifr_addr.sa_len > len) {
                len = ifr->ifr_addr.sa_len;
            }
            ptr += sizeof(ifr->ifr_name) + len;
            if (ifr->ifr_addr.sa_family !=AF_INET) continue;
            if ((cptr = (char *)strchr(ifr->ifr_name,':')) != NULL) *cptr =0;
            if (strncmp(lastname, ifr->ifr_name,IFNAMSIZ) == 0)continue;
            memcpy(lastname, ifr->ifr_name,IFNAMSIZ);
            ifrcopy = *ifr;
            ioctl(sockfd,SIOCGIFFLAGS, &ifrcopy);
            if ((ifrcopy.ifr_flags &IFF_UP) == 0)continue;
            NSString *ip = [NSString stringWithFormat:@"%s",inet_ntoa(((struct sockaddr_in *)&ifr->ifr_addr)->sin_addr)];
            [ips addObject:ip];
        }
    }
    close(sockfd);
    NSString *deviceIP =@"";
    for (int i=0; i < ips.count; i++)
    {
        if (ips.count >0)
        {
            deviceIP = [NSString stringWithFormat:@"%@",ips.lastObject];
        }
    }
    return deviceIP;
}

@end
