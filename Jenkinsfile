library identifier: 'ARM-PIt-libraries@master',
retriever: modernSCM(
  [
    $class: 'GitSCMSource',
    credentialsId: 'cedb6908-8b3d-49a3-9137-a086e65920c3',
    remote: 'git@github.com:ARM-PIt/jenkins-shared-library.git',
    traits:  [[$class: 'jenkins.plugins.git.traits.BranchDiscoveryTrait']]
  ]
)

properties(
  [
    parameters(
      [
        choice(
          name: 'build_type',
          defaultValue: 'weekly',
          choices: ['adhoc','nightly','weekly'].join('\n'),
          description: 'Which build type is this? (adhoc, nightly, weekly)',
        )
      ]
    )
  ]
)

pipelineDockerBuildPushToRegistry project_git_url: "git@github.com:ARM-PIt/traefik-armhf.git", 
project_git_branch: "master",
build_type: "${build_type}",
image_name: "traefik-armhf",
registry_path: "armpits",
registry_url: "https://docker.io",
docker_digest: "sha256:8d99168167baa6a6a0d7851b9684625df9c1455116a9601835c2127df2aaa2f5"
