pragma solidity ^0.4.24;

contract Visit {
    struct Member{
        uint count;
    }
    mapping(address => Member) member_map;
    address[] members;
    function getTotalCount() public returns (uint){
        return members.length;
    }
        //가스를 소모하지않고 직접 주소를 받아오겟다.
    function getMemberInfo(address sender) public view returns (uint){
        Member m = member_map[sender];
        return m.count;
    }
    function visit() public {
        if(member_map[msg.sender].count > 0) {
            member_map[msg.sender].count += 1;
        }else {
            members.push(msg.sender);
            Member memory m;
            m.count = 1;
            member_map[msg.sender] = m;
        }
    }
}
