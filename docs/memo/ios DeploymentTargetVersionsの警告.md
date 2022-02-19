# ios DeploymentTargetVersionsの警告
```
The iOS Simulator deployment target 'IPHONEOS_DEPLOYMENT_TARGET' is set to 8.0, but the range of supported deployment target versions is 9.0 to 14.0.99.
```
のエラーが出たらPodfileに以下を追記

```
post_install do
	|installer| installer.pods_project.targets.each do |target| 
		target.build_configurations.each do |config|
			config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0' 
		end
	end
end
```

XcodeがiOS8対応をしなくなっただけ

---
### Related Notes
- 

### References
- https://qiita.com/temoki/items/46ad22940e819a132435

### Tags
- `#ios` 