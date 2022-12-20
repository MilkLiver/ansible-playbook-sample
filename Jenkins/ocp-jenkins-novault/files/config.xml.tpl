<?xml version='1.0' encoding='UTF-8'?>
<hudson>
    <disabledAdministrativeMonitors>
    ${ADMIN_MON_CONFIG}
    </disabledAdministrativeMonitors>
    <version>2.89.2</version>
    <numExecutors>5</numExecutors>
    <mode>NORMAL</mode>
    <useSecurity>true</useSecurity>
    <authorizationStrategy class="hudson.security.GlobalMatrixAuthorizationStrategy">
        <permission>hudson.model.Computer.Configure:admin</permission>
        <permission>hudson.model.Computer.Delete:admin</permission>
        <permission>hudson.model.Hudson.Administer:admin</permission>
        <permission>hudson.model.Hudson.Read:admin</permission>
        <permission>hudson.model.Item.Build:admin</permission>
        <permission>hudson.model.Item.Configure:admin</permission>
        <permission>hudson.model.Item.Create:admin</permission>
        <permission>hudson.model.Item.Delete:admin</permission>
        <permission>hudson.model.Item.Read:admin</permission>
        <permission>hudson.model.Item.Workspace:admin</permission>
        <permission>hudson.model.Run.Delete:admin</permission>
        <permission>hudson.model.Run.Update:admin</permission>
        <permission>hudson.model.View.Configure:admin</permission>
        <permission>hudson.model.View.Create:admin</permission>
        <permission>hudson.model.View.Delete:admin</permission>
        <permission>hudson.scm.SCM.Tag:admin</permission>
    </authorizationStrategy>
    <securityRealm class="hudson.security.HudsonPrivateSecurityRealm">
        <disableSignup>true</disableSignup>
        <enableCaptcha>false</enableCaptcha>
    </securityRealm>
    <disableRememberMe>false</disableRememberMe>
    <workspaceDir>${ITEM_ROOTDIR}/workspace</workspaceDir>
    <buildsDir>${ITEM_ROOTDIR}/builds</buildsDir>
    <markupFormatter class="hudson.markup.EscapedMarkupFormatter"/>
    <jdks/>
    <viewsTabBar class="hudson.views.DefaultViewsTabBar"/>
    <myViewsTabBar class="hudson.views.DefaultMyViewsTabBar"/>
    <clouds>
        ${KUBERNETES_CONFIG}
        <org.csanchez.jenkins.plugins.kubernetes.KubernetesCloud plugin="kubernetes@1.31.0">
            <name>openshift-custom-internal</name>
            <defaultsProviderTemplate></defaultsProviderTemplate>
            <templates>
                <org.csanchez.jenkins.plugins.kubernetes.PodTemplate>
                    <id>e45d0329-f509-4344-9796-0c4f9421d3af</id>
                    <name>demo-java-builder</name>
                    <privileged>false</privileged>
                    <capOnlyOnAlivePods>false</capOnlyOnAlivePods>
                    <alwaysPullImage>false</alwaysPullImage>
                    <instanceCap>2147483647</instanceCap>
                    <slaveConnectTimeout>1000</slaveConnectTimeout>
                    <idleMinutes>0</idleMinutes>
                    <activeDeadlineSeconds>0</activeDeadlineSeconds>
                    <label>demo-java-builder</label>
                    <hostNetwork>false</hostNetwork>
                    <volumes/>
                    <containers>
                        <org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>
                            <name>jnlp</name>
                            <image>quay.io/openshift/origin-jenkins-agent-base</image>
                            <privileged>false</privileged>
                            <alwaysPullImage>false</alwaysPullImage>
                            <workingDir>/workspace</workingDir>
                            <command></command>
                            <args>$(JENKINS_SECRET) $(JENKINS_NAME)</args>
                            <ttyEnabled>false</ttyEnabled>
                            <resourceRequestCpu></resourceRequestCpu>
                            <resourceRequestMemory></resourceRequestMemory>
                            <resourceRequestEphemeralStorage></resourceRequestEphemeralStorage>
                            <resourceLimitCpu></resourceLimitCpu>
                            <resourceLimitMemory></resourceLimitMemory>
                            <resourceLimitEphemeralStorage></resourceLimitEphemeralStorage>
                            <envVars/>
                            <ports/>
                            <livenessProbe>
                                <execArgs></execArgs>
                                <timeoutSeconds>0</timeoutSeconds>
                                <initialDelaySeconds>0</initialDelaySeconds>
                                <failureThreshold>0</failureThreshold>
                                <periodSeconds>0</periodSeconds>
                                <successThreshold>0</successThreshold>
                            </livenessProbe>
                        </org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>
                        <org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>
                            <name>maven</name>
                            <image>docker.io/library/maven:latest</image>
                            <privileged>false</privileged>
                            <alwaysPullImage>false</alwaysPullImage>
                            <workingDir>/workspace</workingDir>
                            <command>sleep</command>
                            <args>9999999</args>
                            <ttyEnabled>false</ttyEnabled>
                            <resourceRequestCpu></resourceRequestCpu>
                            <resourceRequestMemory></resourceRequestMemory>
                            <resourceRequestEphemeralStorage></resourceRequestEphemeralStorage>
                            <resourceLimitCpu></resourceLimitCpu>
                            <resourceLimitMemory></resourceLimitMemory>
                            <resourceLimitEphemeralStorage></resourceLimitEphemeralStorage>
                            <envVars/>
                            <ports/>
                            <livenessProbe>
                                <execArgs></execArgs>
                                <timeoutSeconds>0</timeoutSeconds>
                                <initialDelaySeconds>0</initialDelaySeconds>
                                <failureThreshold>0</failureThreshold>
                                <periodSeconds>0</periodSeconds>
                                <successThreshold>0</successThreshold>
                            </livenessProbe>
                        </org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>
                        <org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>
                            <name>buildah</name>
                            <image>docker.io/buildah/buildah:latest</image>
                            <privileged>true</privileged>
                            <alwaysPullImage>false</alwaysPullImage>
                            <workingDir>/workspace</workingDir>
                            <command>sleep</command>
                            <args>9999999</args>
                            <ttyEnabled>false</ttyEnabled>
                            <resourceRequestCpu></resourceRequestCpu>
                            <resourceRequestMemory></resourceRequestMemory>
                            <resourceRequestEphemeralStorage></resourceRequestEphemeralStorage>
                            <resourceLimitCpu></resourceLimitCpu>
                            <resourceLimitMemory></resourceLimitMemory>
                            <resourceLimitEphemeralStorage></resourceLimitEphemeralStorage>
                            <envVars/>
                            <ports/>
                            <livenessProbe>
                                <execArgs></execArgs>
                                <timeoutSeconds>0</timeoutSeconds>
                                <initialDelaySeconds>0</initialDelaySeconds>
                                <failureThreshold>0</failureThreshold>
                                <periodSeconds>0</periodSeconds>
                                <successThreshold>0</successThreshold>
                            </livenessProbe>
                        </org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>
                    </containers>
                    <envVars/>
                    <annotations/>
                    <imagePullSecrets/>
                    <nodeProperties/>
                    <yamlMergeStrategy class="org.csanchez.jenkins.plugins.kubernetes.pod.yaml.Overrides"/>
                    <showRawYaml>true</showRawYaml>
                </org.csanchez.jenkins.plugins.kubernetes.PodTemplate>
            </templates>
            <serverUrl>https://kubernetes.default:443</serverUrl>
            <useJenkinsProxy>false</useJenkinsProxy>
            <skipTlsVerify>true</skipTlsVerify>
            <addMasterProxyEnvVars>true</addMasterProxyEnvVars>
            <capOnlyOnAlivePods>false</capOnlyOnAlivePods>
            <namespace>${PROJECT_NAME}</namespace>
            <webSocket>false</webSocket>
            <directConnection>false</directConnection>
            <jenkinsUrl>http://jenkins:80</jenkinsUrl>
            <jenkinsTunnel>jenkins-jnlp:50000</jenkinsTunnel>
            <containerCap>100</containerCap>
            <retentionTimeout>5</retentionTimeout>
            <connectTimeout>5</connectTimeout>
            <readTimeout>15</readTimeout>
            <podLabels>
                <org.csanchez.jenkins.plugins.kubernetes.PodLabel>
                    <key>jenkins</key>
                    <value>slave</value>
                </org.csanchez.jenkins.plugins.kubernetes.PodLabel>
            </podLabels>
            <usageRestricted>false</usageRestricted>
            <maxRequestsPerHost>32</maxRequestsPerHost>
            <waitForPodSec>600</waitForPodSec>
            <podRetention class="org.csanchez.jenkins.plugins.kubernetes.pod.retention.Never"/>
        </org.csanchez.jenkins.plugins.kubernetes.KubernetesCloud>


    </clouds>
    <quietPeriod>1</quietPeriod>
    <scmCheckoutRetryCount>0</scmCheckoutRetryCount>
    <views>
        <hudson.model.AllView>
            <owner class="hudson" reference="../../.."/>
            <name>All</name>
            <filterExecutors>false</filterExecutors>
            <filterQueue>false</filterQueue>
            <properties/>
        </hudson.model.AllView>
    </views>
    <primaryView>All</primaryView>
    <slaveAgentPort>${JNLP_PORT}</slaveAgentPort>
    <disabledAgentProtocols>
        <string>JNLP-connect</string>
        <string>JNLP2-connect</string>
    </disabledAgentProtocols>
    <label>master</label>
    <nodeProperties/>
    <globalNodeProperties/>
    <noUsageStatistics>true</noUsageStatistics>
</hudson>
