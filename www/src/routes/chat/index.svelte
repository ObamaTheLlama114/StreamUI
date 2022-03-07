
{#if chats != undefined || null}
    {#each chats.chats as chat}
        <div>{chat.chatter.username}> {chat.message}</div>
    {/each}
{:else}
    <div>loading...</div>    
{/if}

<script lang="ts">
    import { gql, GraphQLClient } from 'graphql-request'

    const client = new GraphQLClient('http://localhost:4000/graphql')

    let chats

    const GET_CHAT = gql`query {
        chats {
            message
            chatter {
                username
                color
            }
        }
    }`

    try {
        client.request(GET_CHAT).then(
        (val) => {
            chats = val;
            console.log(chats.chats)
        }
    )} catch (e) {
        console.log(e)
    }



</script>