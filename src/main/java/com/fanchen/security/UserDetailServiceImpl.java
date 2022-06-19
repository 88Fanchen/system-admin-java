package com.fanchen.security;

import com.fanchen.entity.SysUser;
import com.fanchen.service.SysUserService;
import com.fanchen.utils.RedisUtil;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserDetailServiceImpl implements UserDetailsService {

    @Resource
    private SysUserService sysUserService;

    @Resource
    private RedisUtil redisUtil;

    @Override
    public UserDetails loadUserByUsername(String username) {
        SysUser sysUser = sysUserService.getByUsername(username);
        if (sysUser == null) {
            throw new UsernameNotFoundException("用户名或密码错误");
        }
        redisUtil.set("User:" + username, sysUser, 3700);
        return new AccountUser(sysUser.getId(), sysUser.getUsername(), sysUser.getPassword(), null);
    }

    /**
     * 获取用户权限信息（角色，菜单权限）
     * @param username 用户id
     * @return 权限列表
     */
    public List<GrantedAuthority> getUserAuthority(String username){
        String authority = sysUserService.getUserAuthority(username);
        return AuthorityUtils.commaSeparatedStringToAuthorityList(authority);
    }

}
