// See LICENSE for license details.

typedef struct packed unsigned {
   logic [ID_WIDTH-1:0] id;
   logic [ADDR_WIDTH-1:0] addr;
   logic [8:0]            len;
   logic [2:0]            size;
   logic [1:0]            burst;
   logic                  lock;
   logic [3:0]            cache;
   logic [2:0]            prot;
   logic [3:0]            qos;
   logic [3:0]            region;
   logic [USER_WIDTH-1:0] user;
} NastiReq;
